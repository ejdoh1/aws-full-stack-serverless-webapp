/* eslint-disable no-undef */
import logo from "./logo.svg";
import "./App.css";
import helpers from "./helpers";
import { useEffect, useState } from "react";

function Home(props) {
  const [apiResponse, setApiResponse] = useState({ greetings: [] });
  const fetchGreetings = async () => {
    setApiResponse(
      await helpers.httpGet(process.env.REACT_APP_API_URL + "/greetings")
    );
  };
  useEffect(() => {
    fetchGreetings();
  }, []);
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Greetings{" "}
          {apiResponse.greetings.map((g) => {
            return (
              <li key={g.greeting + g.greetingTarget}>
                {g.greeting} {g.greetingTarget}
              </li>
            );
          })}
        </p>
        <button onClick={props.signOut}>Sign out</button>
      </header>
    </div>
  );
}

export default Home;
