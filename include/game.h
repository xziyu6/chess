#ifndef GAME_H
#define GAME_H

#include <stdbool.h>
#include <stdint.h>

#define BOARD_SIZE 8

typedef enum {
    EMPTY,
    PAWN,
    KNIGHT,
    BISHOP,
    ROOK,
    QUEEN,
    KING
} PieceType;

typedef struct {
    int8_t board[BOARD_SIZE][BOARD_SIZE];
    bool white_turn;
} ChessGame;

void init_game(ChessGame *game);
bool make_move(ChessGame *game, int from_x, int from_y, int to_x, int to_y);

#endif