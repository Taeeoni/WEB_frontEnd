import { Container, Table, Button } from "react-bootstrap";
import React, { useEffect, useState } from "react";
import Axios from "../Axios.js";
import { useNavigate } from "react-router-dom";

function Add() {
  const [post, setPost] = useState([]); // post에 데이터가 저장 , setPost 통해 데이터가 변경
  const [content, setContent] = useState("");
  const [title, setTitle] = useState("");

  const [file, setFile] = useState([]);
  const [url, setUrl] = useState("");
  const navigate = useNavigate();

  const onChangeTitle = (e) => {
    console.log(e.target);
    console.log(e.target.value);
    setTitle(e.target.value);
  };
  const onChangeContent = (e) => {
    console.log(e.target);
    console.log(e.target.value);
    setContent(e.target.value);
  };

  //파일 업로드
  const fileInput = React.useRef(null);

  const handleButtonClick = (e) => {
    fileInput.current.click();
  };

  const handleChange = (e) => {
    console.log(e.target.files[0]);
    setFile(e.target.files[0]);
    console.log(URL.createObjectURL(e.target.files[0]));
    setUrl(URL.createObjectURL(e.target.files[0]));
  };

  useEffect(() => {
    Axios.get(`/postapi/home/new`)
      .then((res) => res.data)
      .then((data) => setPost(data));
  }, []);

  const AddNotice = async () => {
    await Axios.post(`postapi/home/save`, null, {
      params: {
        title: title,
        content: content,
        views: post.views,
        date: post.date,
      },
    });
    navigate(`/Board`);
  };

  return (
    <Container>
      <Table striped bordered hover>
        <tr>
          <td width="100">번호</td>
          <td colspan="3">신규 (insert)</td>
        </tr>
        <tr>
          <td width="100">제목</td>
          <td colspan="3">
            <input
              onChange={onChangeTitle}
              type="text"
              name="title"
              value={title}
            />
          </td>
        </tr>
        <tr>
          <td width="100">조회수</td>
          <td colspan="3">{post.views}</td>
        </tr>
        <tr>
          <td width="100">등록일</td>
          <td colspan="3">{post.date}</td>
        </tr>
        <tr>
          <td width="100">내용</td>
          <td colspan="3">
            <textarea
              onChange={onChangeContent}
              name="content"
              cols="70"
              rows="15"
            ></textarea>
          </td>
        </tr>
        {file ? (
          <tr>
            <td>
              <a href={url} download>
                {file.name}
              </a>
            </td>
          </tr>
        ) : null}
        <tr>
          <React.Fragment>
            <Button onClick={handleButtonClick}>파일 업로드</Button>
            <input
              type="file"
              ref={fileInput}
              onChange={handleChange}
              style={{ display: "none" }}
            />
          </React.Fragment>
        </tr>
        <tr>
          <td>
            <div>
              <Button onClick={AddNotice} type="submit" variant="dark">
                글 추가
              </Button>
            </div>
          </td>
        </tr>
      </Table>
    </Container>
  );
}

export default Add;
