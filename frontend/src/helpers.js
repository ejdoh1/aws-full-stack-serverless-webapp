import { Auth } from "aws-amplify";

const helpers = {
  httpGet: async function (url) {
    const session = await Auth.currentSession();
    const token = await session.idToken;
    const data = await fetch(url, {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + token.jwtToken,
      },
    });
    const j = await data.json();
    return j;
  },
};
export default helpers;
