# ``Alizeti``

Alizeti means ‘sunflower’ in Swahili. Just as the sun guides sunflowers, we hope our app can guide Solar Mamas on their journey to becoming solar engineers.

## Overview

This app is made of 2 sections shown in ``HomePageView``:

![Screenshot of the first screen of the app](mainPage)

@Row {    
    @Column{
    **Assembly**: In the assembly section the mamas have a guide on how to build the 3 boards: Led Lamp, Diva Lantern and Charge Controller 
    }
    @Column{
        **Test**: In the test section we provide some minigames the mamas can play to train in different skills related to the assembly, such as training in remembering the name of a component, or of a slot.
    }
}
 
 ## File Structure

The file structure of the app is organized into the following core directories:

    •    AssembleFeature: Contains all functionality related to the assembly section.
    •    TestFeature: Includes the logic and UI for the  minigames.
    •    Service: Hosts shared services such as custom navigation and the Text-to-Speech engine.
    •    Asset: Stores all media and static assets used throughout the app (images, sounds, etc.).


## Services

- ``Router``  used to centralize and control view navigation

-  ``TextToSpeech``   provides text-to-speech (TTS) capabilities

## Assemble Feature

Structured into 3 folders
- Models containing the models used in this section
- Views containing all the views used, which is structured itself into 2 folders containing the main views and all the subViews of which the main views are made of 

-  SharedFiles contains things used everhywehre in the app, but also  ``ViewModel`` which manages different types of boards and handles inputs.


### Models

- ``Board``   represents a generic Board (PCB) can be used in the Assemble
 
- ``Component`` represents a component that can be displayed on a board in the app 

###  Views
 the folder contains 2 views, that are the main one, and a folder containing subViews of which the 2 main  view are made of. 

Most important Views: 

- ``AssemblyBoardView``  displays an interactive assembly board along with a scrollable list of its components.

- ``SelectBoardView`` displays the 3 boards and allows the user to select the one they want to assemble


## Test Feature
 
Test Feature is organized into the following folders:

-    One folder per minigame: Each minigame has its own folder containing its specific views and ViewModel.
   
-    SharedView folder: Contains views that are reused across all minigames.
  
-   ViewModel folder: Contains GameViewModel, which provides shared data and functionality used by all minigames.
