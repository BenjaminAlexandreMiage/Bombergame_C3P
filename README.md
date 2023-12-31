# Bombergame

Bombergame is a clone of the classic Bomberman game featuring some changes and adjustments. This project is a collaborative effort by Alexandre Benjamin, Hadid Yanis, and Harrar M'hamed.

Developed using Pharo, Myg and Bloc as part of the C3P course curriculum at the University of Lille for the academic year 2023/2024.

At its core, Bombergame revolves around strategic maze-based gameplay. Players navigate through levels, placing bombs to clear obstacles and outmaneuver opponents.

**Table of Contents**
1. [Installation](#installation)
   - [Dependency Installation](#step-1-dependency-installation)
   - [Cloning the Repository](#step-2-cloning-the-repository)
   - [Verifying the Installation](#step-3-verifying-the-installation)
2. [Running the Game](#running-the-game)
   - [Launching the Game](#launching-the-game)
   - [Understanding the Interface](#understanding-the-interface)
   - [Current Gameplay Features](#current-gameplay-features)
   - [Where to Find the Code and Tests](#where-to-find-the-code-and-tests)
3. [Code Structure and Design](#code-structure-and-design)
   - [Main Game Classes](#main-game-classes)
   - [Specialized Game Element Classes](#specialized-game-element-classes)
   - [Event Handling and User Interaction](#event-handling-and-user-interaction)
   - [Visual Representation and Rendering](#visual-representation-and-rendering)
   - [Testing Focus](#testing-focus)

## Installation

### Step 1: Dependency Installation

With a Pharo image ready, open the Playground and execute the following Metacello commands to handle the dependencies.

#### Command 1:

This command installs the 'Bloc' baseline, a core component for the UI framework of the game.

```smalltalk
Metacello new
    baseline: 'Bloc';
    repository: 'github://pharo-graphics/Bloc:05e5b0e385811719537f8cd89966b150a07be985/src';
    onConflictUseIncoming;
    load;
    lock.
```

#### Command 2:

This command fetches the 'Myg' package, an essential library for the game's functionality.

```smalltalk
Metacello new
    repository: 'github://Ducasse/Myg:v1.0.0';
    baseline: 'Myg';
    onConflictUseIncoming;
    load.
```

### Step 2: Cloning the Repository

After installing dependencies, proceed to clone the Bomberman game repository:

1. Open the Git Repositories Browser in Pharo.
2. Click on 'Add' and select the 'Clone from GitHub' tab.
3. Enter the following repository details:
   - Owner Name: `BenjaminAlexandreMiage`
   - Project Name: `Bombergame_C3P`
   - Protocol: HTTPS or SSH depending on your git configuration

4. If the repository status shows 'NOT LOADED', enter the repository and right-click on each folder to select 'Load'.

### Step 3: Verifying the Installation

Finally, use the System Browser to confirm the successful installation. You should see the folders 'Bomberman' and 'Bomberman-Tests' indicating that the setup is complete and the game is ready to be launched.

## Running the Game

To experience the graphical interface of Bombergame, which is currently under active development, follow these simple steps:

### Launching the Game

1. Open the Pharo Playground in your environment.
2. Execute the following command:

   ```smalltalk
   Bomberman new open.
   ```
   
## Game Screenshot

![Bombergame Screenshot](ressources/GameplayScreenShot.png)


### Understanding the Interface

Upon launching the game, you'll be greeted with the main user interface, where different elements are represented by specific colors:

- **Black**: Represents Walls
- **Green**: Represents Ground
- **Blue**: Represents the Player
- **Brown**: Represents Boxes
- **Gray**: Represents the door to win the level
  
### Current Gameplay Features

As of now, our game engine robustly supports a wide range of actions and movements. However, the user interface is currently limited to generating maps with various types of elements and supporting basic player movement using keyboard arrow keys. This limitation is a strategic choice, stemming from our prioritized development approach that emphasizes game logic and adheres to a test-driven development (TDD) methodology.

#### Upcoming Feature: Bomb Placement and Explosions

A feature involving bomb placement and its subsequent explosions on the graphical interface is nearing completion in our development pipeline. This enhancement, currently under active development in a separate branch named "upgrade UI", promises to bring a more dynamic and interactive gaming experience. 

However, due to the time constraints imposed by the project deadline, we have decided not to merge this feature into the main production branch at this time. One key reason is that the integration of this feature currently causes some of our test cases to fail, causing issues with the stability and reliability of the gameplay.

## Code Structure and Design

Below is an overview of the key classes and their roles in the game's framework.

### Main Game Classes

- **Bomberman Class**: This is the primary class responsible for initializing and launching the game. It acts as the entry point, orchestrating the overall game flow.

- **BombermanBoard Class**: Inherits from `MygBoard`, this class manages the game board (grid). It is central to handling the spatial arrangement of game elements and the interactions between them.

### Specialized Game Element Classes

- **BombermanBonus**: This class encapsulates the functionality of various in-game bonuses. For example, `BombermanBonusLife` is a subclass that specifically manages the logic for adding extra lives to the player.

- **BombermanElement**: Extending `MygAbstractBox`, this class serves as a base for all board elements like players, boxes, walls, etc. It defines common properties and behaviors that are shared across different elements on the game board.

### Event Handling and User Interaction

- **BombermanEvent**: Inheriting from `BlElement`, this class is crucial for handling events, particularly those triggered by keyboard inputs. It works in tandem with the main Bomberman class to interpret and respond to player actions.

### Visual Representation and Rendering

- **BombermanVision**: This class is dedicated to rendering the visual aspects of each element in the game. It ensures that the graphical representation of game elements is consistent and visually appealing.

Based on the detailed file structure of your Bomberman project, additional concepts from your course that are likely utilized in your development can be identified and highlighted. Here's an enhanced description that includes these concepts:

## Utilization of Concepts Covered in Course

In the Bombergame project, we have integrated several key programming concepts taught in our course :

1. **Inheritance**: This is a foundational concept used in our project, with classes like `BombermanBonusLife` inheriting properties and behaviors from their parent classes such as `BombermanBonus`.

2. **Polymorphism**: Demonstrated in subclasses of `BombermanElement`, where methods are redefined to provide unique functionalities, thereby utilizing polymorphism to enhance flexibility and reusability.

3. **Delegation**: Our `Bomberman` class doesn't handle rendering directly but delegates it to `BombermanVision` and `BlSpace`, showcasing the use of delegation to distribute responsibilities among different classes.

4. **Encapsulation**: Each class, such as `BombermanPlayer`, `BombermanBox`, and `BombermanDoor`, encapsulates its data and behavior, ensuring a clear separation of concerns.

5. **Modularity**: The project is organized into modular classes with specific responsibilities, facilitating easier maintenance and keeping the code open to future extensions.

7. **Composition**: Classes like `BombermanBoard` use composition to include instances of other classes (like `BombermanElement`), forming more complex classes and functionnalities.

8. **Single Responsibility Principle**: Each class in the project appears to have a single responsibility, such as handling game elements, managing user events, or rendering the game UI, adhering to the SRP principle.

While we did not heavily incorporate design patterns considering the scope and scale of our code, their addition of could be instrumental down the line in scaling and extending the game in the future.

### Testing Focus

Given the player's central role in the game experience, we have prioritized testing around the player character. This strategy ensures that the core game mechanics involving player interaction are robust and error-free. By extensively testing player-related functionalities, we effectively cover a significant portion of the game's logic and interactions.
