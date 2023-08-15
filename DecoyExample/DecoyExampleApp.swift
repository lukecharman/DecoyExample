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
    DecoyHub.shared.setUp(session: Session(stubing: .shared))
    return (DecoyHub.shared.session as? URLSession) ?? .shared
  }
}
