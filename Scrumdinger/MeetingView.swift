//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Ayush Pratap Singh on 25/05/22.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum : DailyScrum
    @StateObject var scrumTimer = ScrumTimer()

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(scrum.theme.mainColor)
            VStack {
            

                Circle().strokeBorder(lineWidth: 21)
                HStack{
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action:{}){
                    Image(systemName: "forward.fill")
                    }
                }
                .accessibilityLabel("Next speaker")

            }
            .padding()
            .foregroundColor(scrum.theme.accentColor)
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum:.constant(DailyScrum.sampleData[0]))
    }
}
