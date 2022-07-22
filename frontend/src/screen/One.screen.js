import React, { useEffect, useState } from "react";
import { Navigate, useLocation } from "react-router-dom";
import queryString from "query-string";
import Axios from "../Axios.js";
import { Container, Table, Toast, Button } from "react-bootstrap";
import { Link, useNavigate } from "react-router-dom";
import Comment from "./Comment.screen.js";

function One() {
  const navigate = useNavigate();
  const { search } = useLocation();
  const { id } = queryString.parse(search);
  const { modify } = queryString.parse(search);
  const [post, setPost] = useState([]); // post에 데이터가 저장 , setPost 통해 데이터가 변경
  const [content, setContent] = useState("");
  const [title, setTitle] = useState("");

  const onChange = (e) => {
    console.log(e.target);
    console.log(e.target.value);
    setContent(e.target.value);
  };

  const onChangeTitle = (e) => {
    console.log(e.target);
    console.log(e.target.value);
    setTitle(e.target.value);
  };

  useEffect(() => {
    Axios.get(`/postapi/home/findOne?id=${id}`)
      .then((res) => res.data)
      .then((data) => setPost(data))
      .then(setTitle(post.title))
      .then(setContent(post.content));
  }, []);

  function update() {
    Axios.post(`postapi/home/revise`, null, {
      params: {
        id: id,
        title: title,
        content: content,
        views: post.views,
      },
    }).then((res) => (res.data == "OK" ? navigate(`/Board`) : null));
  }

  function deleteNotice() {
    Axios.post(`postapi/home/delete`, null, {
      params: {
        id: post.id,
      },
    });

    navigate(`/Board`);
  }

  console.log(post);
  console.log(id);
  console.log(modify);

  return (
    <Container>
      <h1>게시판 글</h1>

      <Table striped bordered hover>
        <tr>
          <td width="100">번호</td>
          <td colspan="3">{post.id}</td>
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
        {modify == 0 ? (
          <tr>
            <td width="100">제목</td>
            <td colspan="3">
              <input type="text" name="title" value={post.title} readOnly />
            </td>
          </tr>
        ) : (
          <tr>
            <td width="100">제목</td>
            <td colspan="3">
              <input
                onChange={onChangeTitle}
                type="text"
                name="title"
                defaultvalue={post.title}
              />
            </td>
          </tr>
        )}

        <tr>
          <td width="100">조회수</td>
          <td colspan="3">{post.views}</td>
        </tr>
        <tr>
          <td width="100">등록일</td>
          <td colspan="3">{post.date}</td>
        </tr>
        {modify == 0 ? (
          <tr>
            <td width="100">내용</td>
            <td colspan="3">
              <textarea
                name="content"
                cols="70"
                rows="15"
                defaultValue={post.content}
                readOnly
              ></textarea>
            </td>
          </tr>
        ) : (
          <tr>
            <td width="100">내용</td>
            <td colspan="3">
              <textarea
                onChange={onChange}
                name="content"
                cols="70"
                rows="15"
                defaultValue={post.content}
              >
                {content}
              </textarea>
            </td>
          </tr>
        )}

        <tr>
          {modify == 0 ? (
            <td>
              <div>
                <Link to={`/One?id=${id}&modify=1`}>
                  <Button type="submit" variant="dark">
                    글 수정
                  </Button>
                </Link>
              </div>
            </td>
          ) : (
            <td>
              <div>
                <Button onClick={update} type="submit" variant="dark">
                  글 수정 완료
                </Button>
              </div>
            </td>
          )}

          <td>
            <div>
              <Button onClick={deleteNotice} type="submit" variant="dark">
                글 삭제
              </Button>
            </div>
          </td>
          <td>
            <Link to={`/Board`}>
              <Button type="submit" variant="dark">
                홈
              </Button>
            </Link>
          </td>
          <td>
            <Link to={`/AddRe?id=${id}`}>
              <Button type="submit" variant="dark">
                답글달기
              </Button>
            </Link>
          </td>
        </tr>
      </Table>

      <Comment />
    </Container>
  );
}

export default One;
