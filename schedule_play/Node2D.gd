extends Node2D

func _ready():	
	var mix_time = AudioServer.get_last_mix_time()
	mix_time = int(mix_time)
	for i in range(0, 1000):
		var ap = get_node("AudioStreamPlayer").duplicate()
		add_child(ap)
		ap.play_scheduled(_generate_time(mix_time, i))

func _generate_time(mix_time, times):	
	var interval_sec = .2
	var next_audio_event = mix_time + interval_sec * times
	print("Scheduling at mix time " + str(mix_time) + " at " + str(next_audio_event))
	return next_audio_event
