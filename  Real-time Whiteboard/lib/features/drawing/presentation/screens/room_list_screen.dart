import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/drawing_notifier.dart'; // drawingNotifierProvider'ı invalidate etmek için
import '../../application/room_providers.dart';
import 'drawing_screen.dart'; // DrawingScreen'e navigate etmek için

/// Screen to display the list of available drawing rooms and allow creating/deleting rooms.
class RoomListScreen extends ConsumerWidget {
  const RoomListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomList = ref.watch(roomListProvider);
    final roomListNotifier = ref.read(roomListProvider.notifier);

    void navigateToRoom(String roomId) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DrawingScreen(roomId: roomId), // roomId'yi DrawingScreen'e geç
        ),
      );
    }

    void createNewRoom() {
      final newRoomId = 'Room ${roomList.length + 1}'; // Basit bir ID oluşturma
      roomListNotifier.update((state) => [...state, newRoomId]);
      navigateToRoom(newRoomId); // Yeni odaya hemen git
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawing Rooms'),
      ),
      body: ListView.builder(
        itemCount: roomList.length,
        itemBuilder: (context, index) {
          final roomId = roomList[index];

          // Wrap ListTile with Dismissible
          return Dismissible(
            key: Key(roomId), // Unique key for each item
            direction: DismissDirection.endToStart, // Only allow swipe from right to left
            // Background shown when swiping
            background: Container(
              color: Colors.redAccent,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Icon(Icons.delete_forever, color: Colors.white),
            ),
            // Confirmation dialog before actual dismissal
            confirmDismiss: (direction) async {
              return await showDialog<bool>(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: const Text('Confirm Deletion'),
                    content: Text('Are you sure you want to delete room "$roomId"?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(dialogContext).pop(false), // Return false
                      ),
                      TextButton(
                        child: const Text('Delete', style: TextStyle(color: Colors.redAccent)),
                        onPressed: () => Navigator.of(dialogContext).pop(true), // Return true
                      ),
                    ],
                  );
                },
              ) ?? false; // Return false if dialog is dismissed
            },
            // Action executed after confirmation
            onDismissed: (direction) {
              // Remove from the room list
              roomListNotifier.update((state) {
                final newList = List<String>.from(state);
                newList.remove(roomId);
                return newList;
              });
              // Invalidate the associated drawing notifier
              ref.invalidate(drawingNotifierProvider(roomId));

              // Optional: Show a snackbar confirmation
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('"$roomId" deleted')),
              );
            },
            // The actual list tile
            child: ListTile(
              title: Text(roomId),
              // Trailing icon removed as swipe action indicates navigation/deletion
              // trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => navigateToRoom(roomId),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: createNewRoom,
        label: const Text('Create Room'),
        icon: const Icon(Icons.add),
      ),
    );
  }
} 