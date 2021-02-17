import http from 'http';
import {
  slowSort,
  quickSort,
} from './sort.mjs';

(function main() {
  http.createServer(async function listener(request, response){
    response.writeHead(200);
    response.end(quickSort().join(''));
  }).listen(8080, () => console.log('Listening on port 8080'));
})();