extends KinematicBody2D

const SPEED = 20      #Acceleration per frame
const MAX_SPEED = 200 #Max speed that player can move at given frame

#Interesting how friction is defined as the time to stop moving
#instead of the pixels per second that we slow down
const FRICTION = 0.1  #Time to stop motion when not moving

