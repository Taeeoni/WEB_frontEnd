import { Container, Table, Button } from "react-bootstrap";
import React, { useEffect, useState } from "react";
import Axios from "../Axios.js";
import { useNavigate } from "react-router-dom";
import { useLocation } from "react-router-dom";
import queryString from "query-string";

function AddRe() {
  const { search } = useLocation();
  const { id } = queryString.parse(search);
  const [post, setPost] = useState([]); // post에 데이터가 저장 , setPost 통해 데이터가 변경
  const [content, setContent] = useState("");
  const [title, setTitle] = useState("");
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

  useEffect(() => {
    Axios.get(`/postapi/home/reNew?id=${id}`)
      .then((res) => res.data)
      .then((data) => setPost(data));
  }, []);

  function AddNotice() {
    Axios.post(`postapi/home/save/re`, null, {
      params: {
        rootid: post.rootid,
        recnt: post.recnt,
        relevel: post.relevel,
        title: title,
        content: content,
        views: post.views,
        date: post.date,
      },
    });
    navigate(`/Board`);
  }

  return (
    <Container>
      <Table striped bordered hover>
        <tr>
          <td width="100">번호</td>
          <td colspan="3">신규 (insert)</td>
        </tr>
        <tr>
          <td width="100">답글번호</td>
          <td colspan="3">{post.rootid}</td>
        </tr>
        <tr>
          <td width="100">답글순서</td>
          <td colspan="3">{post.recnt}</td>
        </tr>
        <tr>
          <td width="100">답글레벨</td>
          <td colspan="3">{post.relevel}</td>
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

export default AddRe;
