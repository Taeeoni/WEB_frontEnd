import logo from "./logo.svg";
import "./App.scss";
import axios from "axios";
import Layout from "./layout/Layout";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Board from "./screen/Board.screen";
import Main from "./screen/Main.screen";
import One from "./screen/One.screen";

function App() {
  return (
    // <div className="App">

    //BrowserRouter는 한곳에다가 다 몰아넣는다.
    <BrowserRouter>
      <Layout>
        <Routes>
          <Route path="/" element={<Main />}></Route>
          <Route path="/Board" element={<Board />}></Route>
          <Route path="/One" element={<One />} />
        </Routes>
      </Layout>
    </BrowserRouter>

    /* <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>나 수정함22</p>
        <button
          onClick={() => {
            axios
              .get("http://localhost:8889/postapi/home")
              .then((res) => console.log(res));
          }}
        >
          요청
        </button>
      </header>  */
    /* </div> */
  );
}

export default App;
