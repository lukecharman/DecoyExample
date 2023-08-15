import Decoy
import SwiftUI

@main
struct DecoyExampleApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(viewModel: ViewModel(urlSession: session))
    }
  }

  var session: URLSession {
    Decoy.shared.setUp(session: Session())
    return (Decoy.shared.session as? URLSession) ?? .shared
  }
}
