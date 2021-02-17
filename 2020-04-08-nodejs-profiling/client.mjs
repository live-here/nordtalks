import http from 'http';

let count = 0;

(function main() {
  setTimeout(() => {
    console.log('count', count);
    process.exit(1)
  }, 5000);
  setInterval(makeRequest);
})();

function makeRequest() {
  http.get('http://localhost:8080', (response) => {
    const buffer = [];
    response.on('data', function onData(chunk) {
      buffer.push(chunk);
    });
    response.on('end', function onEnd() {
      ++count;
    });
  }).on('error', console.error);
}