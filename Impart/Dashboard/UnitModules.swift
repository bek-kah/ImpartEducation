import Foundation
import SwiftUI

struct UnitModule {
    let title: String
    let content: [AttributedString]
}

var courseInformation: UnitModule {
    var content = [AttributedString]()
    
    let firstHeader = "Course Information"
    
    var firstDescription = AttributedString("""
    Welcome to Impart’s Introduction to Programming with Python. This course provides a foundational understanding of computer programming for students with no prior experience.

    By the end of the course, students will be able to read, write, and analyze Python code as well as test and debug their programs to ensure correctness and reliability. Emphasis is placed on developing problem-solving strategies and algorithmic thinking.
    """)
    firstDescription.font = .custom("Inter-Regular_Light", size: 14)
    if let range = firstDescription.range(of: "Introduction to Programming with Python") {
        firstDescription[range].font = .custom("Inter-Italic_Light-Italic", size: 14)
    }
    content.append(firstDescription)
    
    var secondHeader = AttributedString("How to Take this Course")
    secondHeader.font = .custom("Lora-Regular_Medium", size: 17)
    content.append(secondHeader)
    
    var secondDescription = AttributedString("""
    This course is split into 10 units. Each unit is composed of 3 parts: lectures, labs, and problem sets.

    • Lectures introduce the core material for the week.
    • Labs consist of various programming exercises to develop useful skills and tools.
    • Problem Sets allow you to apply what you’ve learned. These assignments are designed to strengthen your problem-solving skills, test your grasp of key concepts, and help you learn to write clean, efficient, and well-documented code.
    """)
    secondDescription.font = .custom("Inter-Regular_Light", size: 14)
    content.append(secondDescription)
    
    var thirdHeader = AttributedString("Looking Forward")
    thirdHeader.font = .custom("Lora-Regular_Medium", size: 17)
    content.append(thirdHeader)
    
    var thirdDescription = AttributedString("""
    In the next lesson, we’ll get your development environment set up, so that you can write your first program.
    """)
    thirdDescription.font = .custom("Inter-Regular_Light", size: 14)
    content.append(thirdDescription)
    
    return UnitModule(
        title: firstHeader,
        content: content
    )
}


var settingUp: UnitModule {
    var content = [AttributedString]()
    
    let firstHeader = "Setting up Your Development Environment"
    
    var firstDescription = AttributedString("""
    Before you can begin writing and running Python code, you’ll need to prepare your computer with the right tools. This section will guide you through installing Python and setting up a code editor, ensuring that you have everything you need to follow along with the course.
    """)
    firstDescription.font = .custom("Inter-Regular_Light", size: 14)
    content.append(firstDescription)
    
    var secondHeader = AttributedString("Installing Python")
    secondHeader.font = .custom("Lora-Regular_Medium", size: 17)
    content.append(secondHeader)
    
    var secondDescription = AttributedString("""
    Python is the programming language we’ll use throughout the course, and installing it is the first step. We’ll cover the process for Windows, macOS, and Linux to ensure compatibility regardless of your operating system.

    1. Download the latest stable version from the official Python website.
    2. Run the installer and check the box to add Python to your PATH—-this makes it accessible from the command line.
    3. Verify the installation by opening a terminal or command prompt and typing python --version. You should see the version number displayed.
    """)
    secondDescription.font = .custom("Inter-Regular_Light", size: 14)
    if let range = secondDescription.range(of: "official Python website") {
        secondDescription[range].font = .custom("Inter-Regular", size: 14)
        secondDescription[range].link = URL(string: "https://www.python.org/downloads/")!
        secondDescription[range].underlineStyle = .single
        secondDescription[range].foregroundColor = .primary
    }
    if let range = secondDescription.range(of: "check the box to add Python to your PATH") {
        secondDescription[range].font = .custom("Inter-Regular_Medium", size: 14)
    }
    if let range = secondDescription.range(of: "python --version") {
        secondDescription[range].font = .system(size: 14, weight: .medium, design: .monospaced)
    }
    
    content.append(secondDescription)
    
    var thirdHeader = AttributedString("Installing a Code Editor")
    thirdHeader.font = .custom("Lora-Regular_Medium", size: 17)
    content.append(thirdHeader)
    
    var thirdDescription = AttributedString("""
    Good code editors enhances your productivity with features like syntax highlighting, code completion, and debugging tools. For this course, we recommend Visual Studio Code because of its lightweight design and powerful extensions. If you decide to go with this option, make sure to follow the set up tutorial. If you’d like an alternative, PyCharm is a good Python-specific code editor.
    """)
    thirdDescription.font = .custom("Inter-Regular_Light", size: 14)
    if let range = thirdDescription.range(of: "Visual Studio Code") {
        thirdDescription[range].font = .custom("Inter-Regular", size: 14)
        thirdDescription[range].link = URL(string: "https://code.visualstudio.com")!
        thirdDescription[range].underlineStyle = .single
        thirdDescription[range].foregroundColor = .primary
    }
    if let range = thirdDescription.range(of: "tutorial") {
        thirdDescription[range].font = .custom("Inter-Regular", size: 14)
        thirdDescription[range].link = URL(string: "https://code.visualstudio.com/docs/python/python-tutorial")!
        thirdDescription[range].underlineStyle = .single
        thirdDescription[range].foregroundColor = .primary
    }
    if let range = thirdDescription.range(of: "PyCharm") {
        thirdDescription[range].font = .custom("Inter-Regular", size: 14)
        thirdDescription[range].link = URL(string: "https://www.jetbrains.com/pycharm/")!
        thirdDescription[range].underlineStyle = .single
        thirdDescription[range].foregroundColor = .primary
    }
    
    content.append(thirdDescription)
    
    var fourthHeader = AttributedString("Looking Forward")
    fourthHeader.font = .custom("Lora-Regular_Medium", size: 17)
    content.append(fourthHeader)
    
    var fourthDescription = AttributedString("""
    In the next lesson, we’ll write and run your first Python program, introducing basic syntax and the interactive shell.
    """)
    fourthDescription.font = .custom("Inter-Regular_Light", size: 14)
    content.append(fourthDescription)
    
    return UnitModule(
        title: firstHeader,
        content: content
    )
}

func printFonts() {
    for family in UIFont.familyNames.sorted() {
        print("Family: \(family)")
        for font in UIFont.fontNames(forFamilyName: family) {
            print("    \(font)")
        }
    }
}

#Preview {
    UnitModuleView(unitModule: settingUp)
}
