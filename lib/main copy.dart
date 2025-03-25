import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(
    game: SpaceShooterGame(),
    overlayBuilderMap: {
      'mainMenu': (context, SpaceShooterGame game) => MainMenu(game: game),
      'pauseMenu': (context, SpaceShooterGame game) => PauseMenu(game: game),
      'settingsMenu': (context, SpaceShooterGame game) => SettingsMenu(game: game),
    },
    initialActiveOverlays: const ['mainMenu'], // Inicia amb el menú principal
  ));
}

class SpaceShooterGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  late Player player;
  bool isPaused = false;

  @override
  Color backgroundColor() => Colors.blueGrey; // Canviat el color de fons

  @override
  Future<void> onLoad() async {
    return super.onLoad();
  }

  void startGame() {
    overlays.remove('mainMenu');
    loadGame();
  }

  Future<void> loadGame() async {
    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('jungle.png'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );
    add(parallax);

    player = Player();
    add(player);

    add(
      SpawnComponent(
        factory: (index) {
          return Enemy();
        },
        period: 1,
        area: Rectangle.fromLTWH(0, 0, size.x, -Enemy.enemySize),
      ),
    );
  }

  void pauseGame() {
    isPaused = true;
    overlays.add('pauseMenu');
  }

  void resumeGame() {
    isPaused = false;
    overlays.remove('pauseMenu');
  }

  void openSettings() {
    overlays.add('settingsMenu');
  }
}

class Player extends SpriteComponent
    with HasGameReference<SpaceShooterGame> {
  Player()
      : super(
          size: Vector2(100, 150),
          anchor: Anchor.center,
        );

  late final SpawnComponent _bulletSpawner;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await game.loadSprite('gorilla.png');
    add(RectangleHitbox());

    position = game.size / 2;

    _bulletSpawner = SpawnComponent(
      period: 0.2,
      selfPositioning: true,
      factory: (index) {
        return Bullet(
          position: position +
              Vector2(
                0,
                -height / 2,
              ),
        );
      },
      autoStart: false,
    );

    game.add(_bulletSpawner);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void startShooting() {
    _bulletSpawner.timer.start();
  }

  void stopShooting() {
    _bulletSpawner.timer.stop();
  }
}

class Bullet extends SpriteComponent
    with HasGameReference<SpaceShooterGame> {
  Bullet({
    super.position,
  }) : super(
          size: Vector2(25, 50),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await game.loadSprite('banana.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * -500;

    if (position.y < -height) {
      removeFromParent();
    }
  }
}

class Enemy extends SpriteComponent
    with HasGameReference<SpaceShooterGame>, CollisionCallbacks {
  Enemy({
    super.position,
  }) : super(
          size: Vector2.all(enemySize),
          anchor: Anchor.center,
        );

  static const enemySize = 150.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await game.loadSprite('hunter.png');

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * 250;

    if (position.y > game.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Bullet) {
      removeFromParent();
      other.removeFromParent();
      game.add(Explosion(position: position));
    }
  }
}

class Explosion extends SpriteAnimationComponent
    with HasGameReference<SpaceShooterGame> {
  Explosion({
    super.position,
  }) : super(
          size: Vector2.all(150),
          anchor: Anchor.center,
          removeOnFinish: true,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      'explosion.png',
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.1,
        textureSize: Vector2.all(32),
        loop: false,
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  final SpaceShooterGame game;
  const MainMenu({required this.game});

  @override
  Widget build(BuildContext context) => Center(
        child: ElevatedButton(
          onPressed: game.startGame,
          child: Text('Start Game'),
        ),
      );
}

class PauseMenu extends StatelessWidget {
  final SpaceShooterGame game;
  const PauseMenu({required this.game});

  @override
  Widget build(BuildContext context) => Center(
        child: ElevatedButton(
          onPressed: game.resumeGame,
          child: Text('Resume Game'),
        ),
      );
}

class SettingsMenu extends StatelessWidget {
  final SpaceShooterGame game;
  const SettingsMenu({required this.game});

  @override
  Widget build(BuildContext context) => Center(
        child: Text('Settings Coming Soon!'),
      );
}