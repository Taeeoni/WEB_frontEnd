import React, { useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import queryString from "query-string";
import Axios from "../Axios.js";
import { Container, Table, Toast, Button } from "react-bootstrap";

function Comment() {
  const { search } = useLocation();
  const { id } = queryString.parse(search);
  const [post, setPost] = useState([]);
  const [user, setUser] = useState("");
  const [comment, setComment] = useState("");

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
    Axios.get(`/postapi/home/findOne?id=${id}`)
      .then((res) => res.data)
      .then((data) => setPost(data.noticeComments));
  }, []);

  function addComment() {
    Axios.post(`postapi/home/addComment`, null, {
      params: {
        id: id,
        user: user,
        comment: comment,
      },
    });
    window.location.replace(`/One?id=${id}`);
  }

  return (
    <>
      <Table>
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
              <Button onClick={addComment} type="submit" variant="primary">
                댓글 달기
              </Button>
            </div>
          </td>
        </tr>
      </Table>
      <h3>댓글</h3>
      {post.map((c) => {
        function deleteComment() {
          Axios.post(`postapi/home/deleteComment`, null, {
            params: {
              noticeListId: id,
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
    </>
  );
}

export default Comment;
