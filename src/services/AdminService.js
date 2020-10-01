import axios from 'axios';

export default {

  addTopic(topic) {
    return axios.post('/topics', topic)
  },

}