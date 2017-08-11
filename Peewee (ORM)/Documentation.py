help(peewee.SqliteDatabase)
 |  close(self)
 |  
 |  commit(self)
 |  
 |  connect(self)
 |
 |  execute(self, clause)
 |  
 |  execute_sql(self, sql, params=None, require_commit=True)

 |  create_index(self, model_class, fields, unique=False)
 |  
 |  create_sequence(self, seq)
 |  
 |  create_table(self, model_class, safe=False)
 |  
 |  create_tables(self, models, safe=False)

 |  drop_index(self, model_class, fields, safe=False)
 |  
 |  drop_sequence(self, seq)
 |  
 |  drop_table(self, model_class, fail_silently=False, cascade=False)
 |  
 |  drop_tables(self, models, safe=False, cascade=False)

 |  truncate_table(self, model_class, restart_identity=False, cascade=False)
 |  
 |  truncate_tables(self, models, restart_identity=False, cascade=False)

 |  create_foreign_key(self, model_class, field, constraint=None)
 |  
 |  extract_date(self, date_part, date_field)
 |
 |  truncate_date(self, date_part, date_field)

 |  get_binary_type(self)
 |  
 |  get_columns(self, table, schema=None)
 |  
 |  get_foreign_keys(self, table, schema=None)
 |  
 |  get_indexes(self, table, schema=None)
 |  
 |  get_primary_keys(self, table, schema=None)
 |  
 |  get_tables(self, schema=None)

 |  is_closed(self)

help(peewee.Model)
 |  delete_instance(self, recursive=False, delete_nullable=False)
 |  
 |  save(self, force_insert=False, only=None)
 |
 |  create_table(fail_silently=False) from peewee.BaseModel
 |
 |  delete() from peewee.BaseModel
 |
 |  create(**query) from peewee.BaseModel
 |
 |  select(*selection) from peewee.BaseModel
 |
 |  get(*query, **kwargs) from peewee.BaseModel
 |
 |  get_or_create(**kwargs) from peewee.BaseModel

help(os.system)
system(...)
    system(command) -> exit_status
    
    Execute the command (a string) in a subshell.

# To clear the screen
os.system('cls' if os.name == 'nt' else 'clear')

help(sys)
	sys.stdin.read() # used to read multiple line that ends when entring ctrl+d

help(collections.OrderedDict)
 |  clear(self)
 |      od.clear() -> None.  Remove all items from od.
 |  
 |  copy(self)
 |      od.copy() -> a shallow copy of od
 |  
 |  items(self)
 |      D.items() -> a set-like object providing a view on D's items
 |  
 |  keys(self)
 |      D.keys() -> a set-like object providing a view on D's keys
 |  
 |  move_to_end(self, key, last=True)
 |      Move an existing element to the end (or beginning if last==False).
 |      
 |      Raises KeyError if the element does not exist.
 |      When last=True, acts like a fast version of self[key]=self.pop(key).
 |  
 |  pop(self, key, default=<object object at 0x7fe2bfda5080>)
 |      od.pop(k[,d]) -> v, remove specified key and return the corresponding
 |      value.  If key is not found, d is returned if given, otherwise KeyError
 |      is raised.
 |  
 |  popitem(self, last=True)
 |      od.popitem() -> (k, v), return and remove a (key, value) pair.
 |      Pairs are returned in LIFO order if last is true or FIFO order if false.
 |  setdefault(self, key, default=None)
 |      od.setdefault(k[,d]) -> od.get(k,d), also set od[k]=d if k not in od
 |  
 |  update(*args, **kwds)
 |      D.update([E, ]**F) -> None.  Update D from mapping/iterable E and F.
 |      If E present and has a .keys() method, does:     for k in E: D[k] = E[k]
 |      If E present and lacks .keys() method, does:     for (k, v) in E: D[k] = v
 |      In either case, this is followed by: for k, v in F.items(): D[k] = v
 |  
 |  values(self)
 |      D.values() -> an object providing a view on D's values

help(time.strftime)
strftime(...)
    strftime(format[, tuple]) -> string
    
    Convert a time tuple to a string according to a format specification.
    See the library reference manual for formatting codes. When the time tuple
    is not present, current time as returned by localtime() is used.
    
    Commonly used format codes:
    
    %Y  Year with century as a decimal number.
    %m  Month as a decimal number [01,12].
    %d  Day of the month as a decimal number [01,31].
    %H  Hour (24-hour clock) as a decimal number [00,23].
    %M  Minute as a decimal number [00,59].
    %S  Second as a decimal number [00,61].
    %z  Time zone offset from UTC.
    %a  Locale's abbreviated weekday name.
    %A  Locale's full weekday name.
    %b  Locale's abbreviated month name.
    %B  Locale's full month name.
    %c  Locale's appropriate date and time representation.
    %I  Hour (12-hour clock) as a decimal number [01,12].
    %p  Locale's equivalent of either AM or PM.
    
    Other codes may be available on your platform.  See documentation for
    the C library strftime function.
