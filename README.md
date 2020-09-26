# Keys-NCRPG
Поддерживаемые игры	CS: GO
Позволяет создавать ключи для получения NCRPG кредитов, опыт и уровней.
Успешно работает с GAMECMS движком (Покупка РПГ Кредитов) если поменять в конфиге тип ключа.

Требования	
SourceMod 1.9.х или выше
[Keys] Core
[NCRPG] Ядро и модули

Команды	
Типы ключей:

Выдача кредитов: ncrpg_credits

Выдача уровней: ncrpg_level

Выдача опыта: ncrpg_xp

Создание ключей: 
```
 key_create <key> <key_lifetime> <key_use_count> "ncrpg_credits" "amount"
 keys_gen <count> <key_lifetime> <key_use_count> "ncrpg_credits" "amount"
 ```
Где:
 ```
 key - ключ;
 count - количество ключей;
 key_lifetime - время жизни ключа(в секундах | 0 - вечный);
 key_use_count - количество использований ключа;
 key_type - ncrpg_credits/ncrpg_level/ncrpg_xp;
 amount - количество выдаваемых кредитов.
 ``` 
Создание ключей:
```
key_create <key> <key_lifetime> <key_use_count> "ncrpg_credits" "amount"
keys_gen <count> <key_lifetime> <key_use_count> "ncrpg_credits" "amount"
```  
Пример: 
```
key_create "KFJD4957DJ4" 0 1 ncrpg_credits "500"
(Созданный ключ выдаст 500 RPG кредитов, игроку который использовал его)

keys_gen "10" 0 1 ncrpg_credits "500"
(Созданные 10 ключей позволят получить 500 RPG кредитов, игроку который использовал 1 ключ)
```

Установка	
  Распаковать архив на сервер, разложив файлы по папкам соблюдая иерархию
