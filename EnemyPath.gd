extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: Node

@onready var enemy_spawn_timer: Timer = $EnemySpawnTimer

func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	new_enemy.max_health = difficulty_manager.get_enemy_health()
	add_child(new_enemy)
	enemy_spawn_timer.wait_time = difficulty_manager.get_spawn_time()

func _on_difficulty_manager_stop_spawning_enemies() -> void:
	enemy_spawn_timer.stop()
