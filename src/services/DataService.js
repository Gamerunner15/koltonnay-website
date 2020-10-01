import axios from 'axios';

export default {

  getTopicSearchData() {
    return axios.get('/topics')
    }
}