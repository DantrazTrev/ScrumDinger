//
//  ThemePickerView.swift
//  Scrumdinger
//
//  Created by Ayush Pratap Singh on 05/06/22.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection:Theme
    var body: some View {
        Picker("Theme",selection: $selection){
            ForEach(Theme.allCases){theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
    }
}

struct ThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
