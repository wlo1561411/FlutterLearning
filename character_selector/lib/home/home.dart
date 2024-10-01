import 'package:character_selector/create/create_screen.dart';
import 'package:character_selector/home/character_card.dart';
import 'package:character_selector/models/character.dart';
import 'package:character_selector/repository/character_repository.dart';
import 'package:character_selector/shared/styled_button.dart';
import 'package:character_selector/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    List<Character> characters = ref.watch(characterRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your Character'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: characters.length,
                  itemBuilder: (_, index) {
                    return Dismissible(
                        key: ValueKey(characters[index].id),
                        onDismissed: (direction) {
                          ref
                              .read(characterRepositoryProvider.notifier)
                              .delete(characters[index]);
                        },
                        child: CharacterCard(characters[index]));
                  }),
            ),
            StyledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const CreateScreen(),
                      ));
                },
                child: const StyledHeading('Create New'))
          ],
        ),
      ),
    );
  }
}
