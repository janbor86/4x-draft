
class_name Optional

var value: Variant
var type

func _init(v, t):
	value = v
	type = t

static func empty() -> Optional:
	return Optional.new(null, null)

static func of(v: Variant) -> Optional:
	if v:
		return Optional.new(v, typeof(v))
	return empty()
	
func is_present() -> bool:
	return value != null

func valueOf() -> Variant:
	return value
	
func is_empty() -> bool:
	return value == null
	
func present(fn: Callable):
	if is_present():
		fn.call(value)


func valueElse(backup)-> Variant:
	if is_present():
		return value
	return backup
