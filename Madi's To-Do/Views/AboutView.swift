//
//  AboutView.swift
//  Madi's To-Do
//
//  Created by Matthew Condie on 2/1/20.
//  Copyright © 2020 mcondie. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    struct AboutHeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 35))
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    struct AboutBodyStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    struct AboutFinePrintStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 13))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    
    var body: some View {
        
        Group {
            VStack {
                Text("📝To Do...📝").modifier(AboutHeadingStyle())
                Text("Hello, and welcome to my to do app!").modifier(AboutBodyStyle())
                Text("To add tasks, you need to press the plus button in the right hand corner of the main screen and fill in all of the information. To delete tasks you can swipe to the left on a task, or press the edit button in the top left corner. If you press the plus button, but decide that you don't want to make a new task, you can swipe down from the top to exit that screen. To display your notes, edit your task name, or complete a task, you just need to tap on that task and press save when you're done.").modifier(AboutBodyStyle())
                Text("That should be all you need to know, so have a good time using my app!").modifier(AboutBodyStyle())
                Text("Made by Madi Condie for Riverton Elementary's school STEM fair 2020").modifier(AboutFinePrintStyle())
            }
            .navigationBarTitle("About This App")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
