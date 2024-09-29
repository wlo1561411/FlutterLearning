import 'package:character_selector/create/vocation_card.dart';
import 'package:character_selector/home/home.dart';
import 'package:character_selector/models/character.dart';
import 'package:character_selector/models/vocation.dart';
import 'package:character_selector/repository/character_repository.dart';
import 'package:character_selector/shared/styled_button.dart';
import 'package:character_selector/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../shared/styled_text.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _nameTextController = TextEditingController();
  final _sloganTextController = TextEditingController();

  Vocation selectedVocation = Vocation.raider;

  @override
  void dispose() {
    _nameTextController.dispose();
    _sloganTextController.dispose();
    super.dispose();
  }

  void selectVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  void handleCreation() {
    if (_nameTextController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading('Missing Character Name'),
              content: const StyledText('Every Character needs the name...'),
              actions: [
                StyledButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const StyledHeading('Close'),
                )
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });
      return;
    }

    if (_sloganTextController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading('Missing Slogan'),
              content: const StyledText('Every Character needs the slogan...'),
              actions: [
                StyledButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const StyledHeading('Close'),
                )
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });
      return;
    }

    Provider.of<CharacterRepository>(context, listen: false).post(
      Character(
          id: uuid.v4(),
          name: _nameTextController.text,
          slogan: _sloganTextController.text,
          vocation: selectedVocation),
    );

    Navigator.pop(
      context,
      MaterialPageRoute(builder: (ctx) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading('Welcome, new player.'),
              ),
              const Center(
                child:
                    StyledText('Create a name and slogan for your character.'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _nameTextController,
                style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headlineMedium),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_2),
                    label: StyledText('Character name')),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _sloganTextController,
                style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headlineMedium),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.chat),
                    label: StyledText('Character slogan')),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading('Choose a vocation.'),
              ),
              const Center(
                child: StyledText('This determines your skills.'),
              ),
              const SizedBox(
                height: 30,
              ),
              for (int i = 0; i < Vocation.values.length; i++)
                VocationCard(
                    onTap: selectVocation,
                    vocation: Vocation.values[i],
                    selected:
                        selectedVocation.title == Vocation.values[i].title),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading('Good Luck.'),
              ),
              const Center(
                child: StyledText('And enjoy the journey...'),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: StyledButton(
                    onPressed: handleCreation,
                    child: const StyledHeading('Create Character')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
