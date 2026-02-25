//
//  ContentView.swift
//  Appcircle
//
//  Created by Mustafa on 29.12.2021.
//

import SwiftUI
//import FizzBuzzKit
import Flutter

//struct FizzBuzzView: View {
//    var number: Int
//    let fbkit = FizzBuzzKit()
//    var body: some View {
//        HStack {
//            Text("Result: ")
//            Text(fbkit.handle(number: number))
//                .accessibilityIdentifier("result")
//        }
//    }
//}

struct ContentView: View {
    @State var numberString: String = ""
    var body: some View {

        Text("Appcircle")
        Image("Logo")
            .resizable()
            .frame(width: 64, height: 64)

        Form {
            TextField(text: $numberString, prompt: Text("Enter a number")) {
                Text("Number")
            }
//            FizzBuzzView(number: Int(numberString) ?? 0)
            
            Button("Show Flutter!") {
                openFlutterApp()
            }
        }

    }
    
    func openFlutterApp() {
        // Get the RootViewController.
        guard
          let windowScene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene }) as? UIWindowScene,
          let window = windowScene.windows.first(where: \.isKeyWindow),
          let rootViewController = window.rootViewController
        else { return }

        // Create the FlutterViewController without an existing FlutterEngine.
        let flutterViewController = FlutterViewController(
          project: nil,
          nibName: nil,
          bundle: nil)
        flutterViewController.modalPresentationStyle = .overCurrentContext
        flutterViewController.isViewOpaque = false

        rootViewController.present(flutterViewController, animated: true)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
