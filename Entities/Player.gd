extends KinematicBody2D


export var fallingSpeed = 0;

var velocity = Vector2.ZERO
var gravity = 100

var rotateRight = false;
var rotateLeft = false;
var rotationSpeed = 2;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if rotateLeft and rotateRight:
		velocity -= Vector2(0, 5).rotated(rotation);
	elif rotateRight:
		self.rotation += rotationSpeed * delta;
	elif rotateLeft:
		self.rotation -= rotationSpeed * delta;
	
	velocity.y += gravity * delta;
	velocity = move_and_slide(velocity, Vector2.UP);
	fallingSpeed = velocity.y;

func _on_turnLeftZone_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		rotateLeft = true;
	elif event is InputEventScreenTouch and !event.pressed:
		rotateLeft = false;


func _on_turnRightZone_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		rotateRight = true;
	elif event is InputEventScreenTouch and !event.pressed:
		rotateRight = false;
