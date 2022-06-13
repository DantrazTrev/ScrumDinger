//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Ayush Pratap Singh on 25/05/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum : DailyScrum
    @State private var data = DailyScrum.Data()
    @State private var isPresentingEditView = false
    var body: some View {
        List{
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)){
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) mintues")
                    }
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                    }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")) {
            ForEach(scrum.attendees) { attendee in
                Label(attendee.name, systemImage: "person")
            }
            }
            
            Section(header: Text("History")) {
                if(scrum.history.isEmpty){
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history){
                    history in
                    HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                            }
                }
            }
            .navigationTitle(scrum.title)
            .toolbar(content: {
                Button("Edit") {
                        isPresentingEditView = true
                    data = scrum.data
                         }
            })
            .sheet(isPresented: $isPresentingEditView) {
                NavigationView{
                    DetailsEditView(data:$data)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                isPresentingEditView = false
                                    scrum.update(from: data)
                                }
                            }
                        }
                    
                }
            }
        }
       
    }
}

struct DetailView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
