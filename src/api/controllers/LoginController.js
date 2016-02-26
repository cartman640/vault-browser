/**
 * LoginController
 *
 * @description :: Server-side logic for managing logins
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	index: function(req, res){
    console.log('hello, this is neat');
    console.log('VAULT_ADDR: ' + process.env.VAULT_ADDR);
    return res.view('test');
  }
};

