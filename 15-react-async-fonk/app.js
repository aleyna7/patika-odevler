import axios from "axios";

const getUsers = (user_id) => {
  return new Promise(async (res, rej) => {
    const { data } = await axios(
      "https://jsonplaceholder.typicode.com/users/" + user_id
    );
    res(data);
    rej("error users");
  });
};

const getPost = (user_id) => {
  return new Promise(async (res, rej) => {
    const { data } = await axios(
      "https://jsonplaceholder.typicode.com/posts?userId=" + user_id
    );
    res(data);
    rej("error post");
  });
};

const getData = async (user_id) => {
  try {
    const users = await getUsers(user_id);
    const post = await getPost(user_id);

    const result = [users, post];
    return result;
  } catch (e) {
    console.log(e);
  }
};

export default getData;