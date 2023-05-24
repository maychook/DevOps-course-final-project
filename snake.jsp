<!DOCTYPE html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Snake Game using HTML and Javascript</title>
    <style>
        .game-box {
            text-align:center;   
        }
        .game-info {
            text-align:center; 
            font-family:arial;
            line-height:24px;
        }
    </style>
  </head>
  <body>
    <div class="game-box"><canvas id="canvas" width="400" height="400"></canvas></div>
    <div class="game-info">
        <h2>Snake Game</h2>
        <p id="game-status"></p>
        <p id="game-score"></p>
    </div>

    <script>
      var canvas, ctx, gameControl, gameActive;
      // render X times per second
      var x = 8;
      
      const CANVAS_BORDER_COLOUR = 'black';
      const CANVAS_BACKGROUND_COLOUR = "white";
      const SNAKE_COLOUR = 'lightgreen';
      const SNAKE_BORDER_COLOUR = 'darkgreen';


      window.onload = function() {
        canvas = document.getElementById("canvas");
        ctx = canvas.getContext("2d");

        document.addEventListener("keydown", keyDownEvent);

        gameControl = startGame(x);
      };
      
      /* function to start the game */
      function startGame(x) {
          // setting gameActive flag to true
          gameActive = true;
          document.getElementById("game-status").innerHTML = "<small>Game Started</small>";
          document.getElementById("game-score").innerHTML = "";
          return setInterval(draw, 1000 / x);
      }
      
      function pauseGame() {
          // setting gameActive flag to false
          clearInterval(gameControl);
          gameActive = false;
          document.getElementById("game-status").innerHTML = "<small>Game Paused</small>";
      }
      
      function endGame(x) {
          // setting gameActive flag to false
          clearInterval(gameControl);
          gameActive = false;
          document.getElementById("game-status").innerHTML = "<small>Game Over</small>";
          document.getElementById("game-score").innerHTML = "<h1>Score: " + x + "</h1>";
      }

      // game world
      var gridSize = (tileSize = 20); // 20 x 20 = 400
      var nextX = (nextY = 0);

      // snake
      var defaultTailSize = 3;
      var tailSize = defaultTailSize;
      var snakeTrail = [];
      var snakeX = (snakeY = 10);

      // apple
      var appleX = (appleY = 15);

      // draw
      function draw() {
        // move snake in next pos
        snakeX += nextX;
        snakeY += nextY;

        // snake over game world?
        if (snakeX < 0) {
          snakeX = gridSize - 1;
        }
        if (snakeX > gridSize - 1) {
          snakeX = 0;
        }

        if (snakeY < 0) {
          snakeY = gridSize - 1;
        }
        if (snakeY > gridSize - 1) {
          snakeY = 0;
        }

        //snake bite apple?
        if (snakeX == appleX && snakeY == appleY) {
          tailSize++;

          appleX = Math.floor(Math.random() * gridSize);
          appleY = Math.floor(Math.random() * gridSize);
        }

        //  Select the colour to fill the canvas
      ctx.fillStyle = CANVAS_BACKGROUND_COLOUR;
      //  Select the colour for the border of the canvas
      ctx.strokestyle = CANVAS_BORDER_COLOUR;

      // Draw a "filled" rectangle to cover the entire canvas
      ctx.fillRect(0, 0, canvas.width, canvas.height);
      // Draw a "border" around the entire canvas
      ctx.strokeRect(0, 0, canvas.width, canvas.height);

        // paint snake
        ctx.fillStyle = SNAKE_COLOUR;
        ctx.strokestyle = SNAKE_BORDER_COLOUR;
        for (var i = 0; i < snakeTrail.length; i++) {
          ctx.fillRect(
            snakeTrail[i].x * tileSize,
            snakeTrail[i].y * tileSize,
            tileSize,
            tileSize
          );
          
          ctx.strokeRect(snakeTrail[i].x * tileSize , snakeTrail[i].y* tileSize, tileSize, tileSize);

          //snake bites it's tail?
          if (snakeTrail[i].x == snakeX && snakeTrail[i].y == snakeY) {
            if(tailSize > 3) {
                endGame(tailSize);
            }
            tailSize = defaultTailSize;  
          }
        }

        // paint apple
        ctx.fillStyle = "red";
        ctx.fillRect(appleX * tileSize, appleY * tileSize, tileSize, tileSize);

        //set snake trail
        snakeTrail.push({ x: snakeX, y: snakeY });
        while (snakeTrail.length > tailSize) {
          snakeTrail.shift();
        }
      }

      // input
      function keyDownEvent(e) {
        switch (e.keyCode) {
          case 37:
            nextX = -1;
            nextY = 0;
            break;
          case 38:
            nextX = 0;
            nextY = -1;
            break;
          case 39:
            nextX = 1;
            nextY = 0;
            break;
          case 40:
            nextX = 0;
            nextY = 1;
            break;
          case 32:
            if(gameActive == true) {
                pauseGame();
            }
            else {
                gameControl = startGame(x);
            }
            break;
        }
      }
    </script>
  </body>
</html>