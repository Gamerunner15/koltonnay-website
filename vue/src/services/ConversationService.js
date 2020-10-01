import axios from 'axios';

export default {

  sendIt(conversation) {
    return axios.post('/conversation', conversation)
  },

  sendJobSearch(jobSearch) {
    return axios.post('/job-search', jobSearch)
  }
}