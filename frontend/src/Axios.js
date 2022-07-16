import axios from "axios";

const Axios = axios.create({
  baseURL: "http://localhost:8889",
  headers: {
    "content-type": "application/json;charset=utf-8",
  },
  withCredentials: true,
});

export default Axios;
