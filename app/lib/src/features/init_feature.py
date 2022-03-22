import argparse
import os

def add_screen(feature):
    screen = """import 'package:app/src/core/widgets/base_screen.dart';import 'package:flutter/material.dart';class PlaceholderScreen extends BaseScreen {const PlaceholderScreen({Key? key}) : super(key: key);}"""
    with open(os.path.join("presentation", "screens", "{}_screen.dart".format(feature)), "w") as screen_file:
        screen_file.write(screen)

def main():
    parser = argparse.ArgumentParser(description="Initialize a new feature folder")
    parser.add_argument("feature", type=str, help="Name of the feature")
    parser.add_argument("--add_screen", action="store_true", help="Add <feature>_screen.dart in <feature>/presentation/screens")
    args = parser.parse_args()
    feature = args.feature
    
    try:
        os.mkdir(feature)
    except FileExistsError:
        print("This feature already exists. Adding missing files.")
        
    os.chdir(feature)
    
    try:
        os.makedirs(os.path.join("data", "models"))
    except FileExistsError:
        pass
    try:
        os.makedirs(os.path.join("data", "repositories"))
    except FileExistsError:
        pass
    try:
        os.makedirs(os.path.join("data", "sources"))
    except FileExistsError:
        pass
    try:
        os.makedirs(os.path.join("domain", "entities"))
    except FileExistsError:
        pass
    try:
        os.makedirs(os.path.join("domain", "usecases"))
    except FileExistsError:
        pass
    try:
        os.makedirs(os.path.join("domain", "repositories"))
    except FileExistsError:
        pass
    try:
        os.makedirs(os.path.join("presentation", "widgets"))
    except FileExistsError:
        pass
    try:
        os.makedirs(os.path.join("presentation", "screens"))
    except FileExistsError:
        pass
    try:
        os.makedirs(os.path.join("presentation", "providers"))
    except FileExistsError:
        pass

    if (args.add_screen):
        add_screen(feature)


if __name__ == "__main__":
    main()