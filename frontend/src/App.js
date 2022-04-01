import "./App.css";
import { Amplify } from "aws-amplify";
import Home from "./Home";
import { Authenticator } from "@aws-amplify/ui-react";
import "@aws-amplify/ui-react/styles.css";

import awsExports from "./aws-exports";
Amplify.configure(awsExports);

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Authenticator>
          {({ signOut, user }) => <Home signOut={signOut} />}
        </Authenticator>
      </header>
    </div>
  );
}

export default App;
