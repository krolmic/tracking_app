part of '../settings_screen.dart';

class _UserProfileAvatar extends StatelessWidget {
  const _UserProfileAvatar({this.setEmoji});

  final String? setEmoji;

  static const _emojiSize = 75.0;

  static const _availableEmojis = [
    AnimatedEmojis.cowFace,
    AnimatedEmojis.unicorn,
    AnimatedEmojis.lizard,
    AnimatedEmojis.tRex,
    AnimatedEmojis.dinosaur,
    AnimatedEmojis.turtle,
    AnimatedEmojis.crocodile,
    AnimatedEmojis.snake,
    AnimatedEmojis.frog,
    AnimatedEmojis.rabbit,
    AnimatedEmojis.rat,
    AnimatedEmojis.poodle,
    AnimatedEmojis.dog,
    AnimatedEmojis.guideDog,
    AnimatedEmojis.serviceDog,
    AnimatedEmojis.pig,
    AnimatedEmojis.racehorse,
    AnimatedEmojis.donkey,
    AnimatedEmojis.ox,
    AnimatedEmojis.goat,
    AnimatedEmojis.kangaroo,
    AnimatedEmojis.tiger,
    AnimatedEmojis.monkey,
    AnimatedEmojis.gorilla,
    AnimatedEmojis.orangutan,
    AnimatedEmojis.chipmunk,
    AnimatedEmojis.otter,
    AnimatedEmojis.bird,
    AnimatedEmojis.blackBird,
    AnimatedEmojis.rooster,
    AnimatedEmojis.hatchingChick,
    AnimatedEmojis.babyChick,
    AnimatedEmojis.hatchedChick,
    AnimatedEmojis.eagle,
    AnimatedEmojis.peace,
    AnimatedEmojis.goose,
    AnimatedEmojis.seal,
    AnimatedEmojis.shark,
    AnimatedEmojis.whale,
    AnimatedEmojis.blowfish,
    AnimatedEmojis.crab,
    AnimatedEmojis.octopus,
    AnimatedEmojis.jellyfish,
  ];

  Future<void> _showEmojiPicker({
    required BuildContext context,
    required Future<void> Function(String) onEmojiSelected,
  }) async {
    final selectedEmoji = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AppDialog(
          title: AppLocalizations.of(context)!.selectEmoji,
          body: Padding(
            padding: const EdgeInsets.only(top: verticalPaddingLarge),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.4,
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: _availableEmojis.map((emoji) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pop(emoji.name),
                    child: Container(
                      decoration: BoxDecoration(
                        color: setEmoji == emoji.name
                            ? AppColors.lightBlue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: AnimatedEmoji(
                        emoji,
                        size: 50,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          buildConfirmButton: false,
        );
      },
    );

    if (selectedEmoji != null) {
      await onEmojiSelected(selectedEmoji);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          child: CircleAvatar(
            backgroundColor: AppColors.lightBlueAccent,
            radius: 75,
            child: setEmoji != null
                ? AnimatedEmoji(
                    AnimatedEmojis.values.firstWhere(
                      (e) => e.name == setEmoji,
                      orElse: () => AnimatedEmojis.otter,
                    ),
                    size: _emojiSize,
                  )
                : const AnimatedEmoji(
                    AnimatedEmojis.otter,
                    size: _emojiSize,
                  ),
          ),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              icon: const Icon(
                Iconsax.edit_2_bold,
                color: Colors.white,
                size: 15,
              ),
              onPressed: () => _showEmojiPicker(
                context: context,
                onEmojiSelected:
                    context.read<SettingsCubit>().updateUserPicture,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
