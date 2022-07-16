import React, { useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import queryString from "query-string";
import Axios from "../Axios.js";
import { Container, Table, Toast, Button } from "react-bootstrap";
import { Link } from "react-router-dom";

function One() {
  const { search } = useLocation();
  const { id } = queryString.parse(search);
  const [post, setPost] = useState([]); // post에 데이터가 저장 , setPost 통해 데이터가 변경
  const [content, setContent] = useState("");

  const onChange = (e) => {
    console.log(e.target);
    console.log(e.target.value);
    setContent(e.target.value);
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
                    <Link to={`/Board`}>
                      <Button type="submit" variant="dark">
                        글 삭제
                      </Button>
                    </Link>
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
                        type="text"
                        name="user"
                        placeholder="닉네임을 입력하세요"
                      />
                    </div>
                  </td>
                  <td>
                    <textarea name="comment" cols="45" rows="2"></textarea>
                  </td>
                  <td>
                    <div>
                      <Button href="#" type="submit" variant="primary">
                        댓글 달기
                      </Button>
                    </div>
                  </td>
                </tr>
              </Table>

              {p.noticeComments.map((c) => {
                return (
                  <Toast>
                    <Toast.Header>
                      <strong className="me-auto">{c.user}</strong>
                      <small></small>
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
