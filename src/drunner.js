var fs = require('fs');

function write(key, value){
  fs.readFile('/config/drunner.json', function(err, data){
    if(err && err.code == 'ENOENT'){
      fs.open('/config/drunner.json', 'w', function(err, fd){
        if(err) throw err;
        var data = {};
        data[key] = value;
        var fileBuffer = new Buffer(JSON.stringify(data));
        fs.write(fd, fileBuffer, 0, fileBuffer.length, function(err, written, buffer){
          if(err) throw err;
          console.log('Done');
          return;
        })
      })
    } else if(err){
      throw err;
    } else {
      if(data.length > 0)
        data = JSON.parse(data);

      data[key] = value;

      fs.writeFile('/config/drunner.json', JSON.stringify(data), function(err){
        if(err) throw err;

        console.log('Done');
      })
    }
  });
}

function read(key, cb){
  fs.readFile('/config/drunner.json', function(err, data){
    if(err) cb(err, null);

    if(data.length > 0){
      data = JSON.parse(data);

      return cb(null, data[key]);
    }

    return cb(null, null);
  });
}

function readAll(cb){
  fs.readFile('/config/drunner.json', function(err, data){
    if(err) cb(err, null);

    if(data.length > 0){
      data = JSON.parse(data);

      return cb(null, data);
    }

    return cb(null, null);
  });
}

switch(process.argv[2]){
  case 'write':
    write(process.argv[3], process.argv[4]);
    break;

  case 'read':
    read(process.argv[3], function(err, data){
      if(err) throw err;

      if(data) {
        process.stdout.write(data + '\n');
        return data;
      }
      return null;
    });
    break;

  case 'setenv':
    readAll(function(err, data){
      if(err) throw err;

      for(key in data){
        process.env[key] = data[key];
      }
    });
    break;
}
