@tool
extends EditorScript

func test(case: Callable):
	var time_before = Time.get_ticks_msec()

	for i in ITERATIONS:
		case.call()

	var time_taken = Time.get_ticks_msec() - time_before

	print("%dms - %s" % [time_taken, case.get_method()])

# ===============================================================

## Specify a number of iterations that takes your PC a couple of seconds per test
const ITERATIONS = 1000000

## Implement your tests

var untyped = 0
var inferred := 0
var typed: int = 0

func inc_untyped():
	untyped += 1

func inc_typed():
	typed += 1

func inc_inferred():
	inferred += 1

## Run your tests via Ctrl + Shift + X
func _run():
	print("Running tests with " + str(ITERATIONS) + " iterations each...")

	test(inc_untyped)
	test(inc_inferred)
	test(inc_typed)
