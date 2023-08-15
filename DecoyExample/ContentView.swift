import SwiftUI

struct ContentView: View {
  var viewModel = ViewModel(urlSession: .shared)

  @State var labelText: String = ""

  var body: some View {
    VStack {
      Text(labelText)
        .padding()
      Button("Load Random Word") {
        loadRandomWord()
      }
      .padding()
      Button("Load Language Count") {
        loadLanguageCount()
      }
      .padding()
    }
    .padding()
  }

  func loadRandomWord() {
    viewModel.fetchRandomWord { result in
      switch result {
      case .success(let success):
        labelText = success
      case .failure(let failure):
        labelText = failure.localizedDescription
      }
    }
  }

  func loadLanguageCount() {
    viewModel.fetchLanguageCount { result in
      switch result {
      case .success(let success):
        labelText = "\(success)"
      case .failure(let failure):
        labelText = failure.localizedDescription
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
