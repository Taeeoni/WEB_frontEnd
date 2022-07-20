import React, { useEffect, useState } from "react";
import { Navigate, useLocation } from "react-router-dom";
import queryString from "query-string";
import Axios from "../Axios.js";
import { Container, Table, Toast, Button } from "react-bootstrap";
import { Link, useNavigate } from "react-router-dom";

function One() {
  const navigate = useNavigate();
  const { search } = useLocation();
  const { id } = queryString.parse(search);
  const [post, setPost] = useState([]); // post에 데이터가 저장 , setPost 통해 데이터가 변경
  const [content, setContent] = useState("");
  const [user, setUser] = useState("");
  const [comment, setComment] = useState("");

  const onChange = (e) => {
    console.log(e.target);
    console.log(e.target.value);
    setContent(e.target.value);
  };

  const onChangeUser = (e) => {
    console.log(e.target);
    console.log(e.target.value);
    setUser(e.target.value);
  };

  const onChangeComment = (e) => {
    console.log(e.target);
    console.log(e.target.value);
    setComment(e.target.value);
  };

  useEffect(() => {
    Axios.get(`/postapi/home`)
      .then((res) => res.data)
      .then((data) => setPost(data.content));
  }, []);

  console.log(post);

  return (
    <Container>
      <h1>게시판 글</h1>

      {post.map((p) => {
        function update() {
          Axios.post(`postapi/home/revise`, null, {
            params: {
              id: p.id,
              title: p.title,
              content: content,
              views: p.views,
            },
          });

          navigate(`/Board`);
        }

        function deleteNotice() {
          Axios.post(`postapi/home/delete`, null, {
            params: {
              id: p.id,
            },
          });

          navigate(`/Board`);
        }

        function addComment() {
          Axios.post(`postapi/home/addComment`, null, {
            params: {
              id: p.id,
              user: user,
              comment: comment,
            },
          });
          window.location.replace(`/One?id=${id}`);
        }

        if (p.id == id) {
          console.log(p);
          return (
            <div>
              <Table striped bordered hover>
                <tr>
                  <td width="100">번호</td>
                  <td colspan="3">{p.id}</td>
                </tr>
                <tr>
                  <td width="100">제목</td>
                  <td colspan="3">
                    <input type="text" name="title" value={p.title} />
                  </td>
                </tr>
                <tr>
                  <td width="100">조회수</td>
                  <td colspan="3">{p.views}</td>
                </tr>
                <tr>
                  <td width="100">등록일</td>
                  <td colspan="3">{p.date}</td>
                </tr>
                <tr>
                  <td width="100">내용</td>
                  <td colspan="3">
                    <textarea
                      onChange={onChange}
                      name="content"
                      cols="70"
                      rows="15"
                    >
                      {p.content}
                    </textarea>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div>
                      <Button onClick={update} type="submit" variant="dark">
                        글 수정
                      </Button>
                    </div>
                  </td>
                  <td>
                    <div>
                      <Button
                        onClick={deleteNotice}
                        type="submit"
                        variant="dark"
                      >
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
                </tr>
                <tr>
                  <td colspan="2">
                    <div>
                      <input
                        onChange={onChangeUser}
                        type="text"
                        name="user"
                        placeholder="닉네임을 입력하세요"
                      />
                    </div>
                  </td>
                  <td>
                    <textarea
                      onChange={onChangeComment}
                      name="comment"
                      cols="45"
                      rows="2"
                    ></textarea>
                  </td>
                  <td>
                    <div>
                      <Button
                        onClick={addComment}
                        type="submit"
                        variant="primary"
                      >
                        댓글 달기
                      </Button>
                    </div>
                  </td>
                </tr>
              </Table>

              {p.noticeComments.map((c) => {
                function deleteComment() {
                  Axios.post(`postapi/home/deleteComment`, null, {
                    params: {
                      noticeListId: p.id,
                      id: c.id,
                      user: c.user,
                      comment: c.comment,
                    },
                  });
                  window.location.replace(`/One?id=${id}`);
                }
                return (
                  <Toast onClose={deleteComment}>
                    <Toast.Header>
                      <input type="hidden" value={c.id} />
                      <strong className="me-auto">{c.user}</strong>
                    </Toast.Header>
                    <Toast.Body>{c.comment}</Toast.Body>
                  </Toast>
                );
              })}
            </div>
          );
        }
      })}
    </Container>
  );
}

export default One;
