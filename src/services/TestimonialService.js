import axios from 'axios'

export default {
// this is a fake call, but axios is still imported as it would be if i were really calling an API
  getTestimonial () {
    axios.get('/fakeURL')
    const fakeMonth = Math.floor(Math.random() * 13)
    if (fakeMonth < 3) {
      return 'https://www.youtube.com/embed/c7D-TuJTK2M'
    } else if (fakeMonth > 3 && fakeMonth < 6) {
      return 'https://www.youtube.com/embed/jLGYZAur3y4'
    } else {
      return 'https://www.youtube.com/embed/_wWwbxWyDWA'
    }
  }
}
