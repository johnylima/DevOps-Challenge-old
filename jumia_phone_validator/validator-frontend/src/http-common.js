import axios from "axios";

export default axios.create({
  baseURL: "http://ae020b7893946410d9932488245dc225-739131864.eu-west-3.elb.amazonaws.com/api/v1",
  headers: {
    "Content-type": "application/json",
  },
});
