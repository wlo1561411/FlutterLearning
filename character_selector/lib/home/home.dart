import 'package:character_selector/create/create_screen.dart';
import 'package:character_selector/home/character_card.dart';
import 'package:character_selector/repository/character_repository.dart';
import 'package:character_selector/shared/styled_button.dart';
import 'package:character_selector/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
              child: Consumer<CharacterRepository>(
                builder: (context, repo, child) {
                  return ListView.builder(
                      itemCount: repo.get().length,
                      itemBuilder: (_, index) {
                        return CharacterCard(repo.get()[index]);
                      });
                }
              ),
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
