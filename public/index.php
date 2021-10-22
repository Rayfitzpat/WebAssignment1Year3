<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

// require __DIR__ . '/../vendor/autoload.php';

// Instantiate App
$app = AppFactory::Create();

// Add error middleware
$app->addErrorMiddleware(true, true, true);
$app->addBodyParsingMiddleware(); // <<<---- here
$app->setBasePath("\webDev3\Assignment1\WebAssignment1Year3\public");

// Add routes
$app->get('/', function (Request $request, Response $response) {
    $response->getBody()->write('<a href="./hello/world">Try ./hello/world</a>');
    return $response;
});

$app->get('/hello/{name}', function (Request $request, Response $response, $args) {
    $name = $args['name'];
    $response->getBody()->write("Hello, $name");
    return $response;
});
  
// Get all films
$app->get('/filmList', function (Request $request, Response $response, $args) {

    require_once('database.php');
    // Get all films
    $query = 'SELECT * FROM filmList';
    //$film contains the result set as an array    
    $film = $db->query($query)->fetchAll(PDO::FETCH_ASSOC); 

    //$response->getBody()->write(json_encode($film)); Option 1
    //return $response->withHeader('Content-Type', 'application/json');
    return $response->withJson($film, 200); // Option 2

});

// Get film with a specific ID
$app->get('/film/{id}', function (Request $request, Response $response, $args) {

    require_once('database.php');
    // Get film with ID
    $id = $args['id'];
    $query = "SELECT * FROM filmList WHERE id = $id";
    $film = $db->query($query)->fetchAll(PDO::FETCH_ASSOC);

    if (count($film)) {
        return $response->withJson($film, 200);
    } else {
        return $response->withJson(array("Unable to find film with id: " . $id), 404);
    }

});

// Delete film with a specific ID
$app->delete('/film/{id}', function (Request $request, Response $response, $args) {

    require_once('database.php');
    // Get film with ID
    $id = $args['id'];
    $query = "DELETE FROM filmList  WHERE ID = $id";
    $delete_count = $db->exec($query);

    if ($delete_count) {
        return $response->withJson(array($delete_count), 204);
    } else {
        return $response->withJson(array("Unable to delete film with id: " . $id), 404); // can't find film
    }

});
 //******************************************************
// Get film with a search term
$app->get('/film/search/{search}', function (Request $request, Response $response, $args) {

    require_once('database.php');
    // Get film with ID
    $search = $args['search'];
    $query = "SELECT * FROM filmList WHERE name LIKE '%$search%'";
    $film = $db->query($query)->fetchAll(PDO::FETCH_ASSOC);

    if (count($film)) {
        return $response->withJson($film, 200);
    } else {
        return $response->withJson(array("Unable to find film with term: " . $search), 404);
    }

});

/* Add new film using JSON
 *  {
 *     
 *   }
 */ 
$app->post('/film', function (Request $request, Response $response, $args) {

    require_once('database.php');
    // Get film details
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array


    $name = $data["name"];
    $year = $data["year"];
    $grapes = $data["grapes"];
    $country = $data["country"];
    $region = $data["region"];
    $description = $data["description"];
    $picture = $data["picture"];
       
  

    $query = "INSERT INTO filmList (name, year, grapes, country, region, description, picture)  VALUES ('$name', '$year', '$grapes', '$country', '$region', '$description', '$picture')";
    $response->getBody()->write("$query");
    return $response;
    $insert_count = $db->exec($query);

    if ($insert_count) {
        return $response->withJson(array($insert_count), 201);
    } else {
        return $response->withJson(array("Unable to save new film with these details: name: " . $name . "year: " . $year . "grapes: " . $grapes . "country: ". $country . "region: ". $region . "description: " . $description . "picture :" . $picture), 500); // can't save film
    }

});

/* Update new film using JSON
 *  {
 *      "make": "Ferrari",
 *      "model": "Enzo"
 *   }
 */
$app->put('/film/{id}', function (Request $request, Response $response, $args) {

    require_once('database.php');
    // Get film details
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array

    $id = $args['id'];
    $make = $data["make"];
    $model = $data["model"];

    $query = "UPDATE filmList set make = '$make', model = '$model' WHERE ID = '$id'";
    $update_count = $db->exec($query);

    if ($update_count) {
        return $response->withJson(array($update_count), 200);
    } else {
        return $response->withJson(array("Unable to update film with id: " . $id), 404); // can't find film
    }

});

try {
    $app->run();     
} catch (Exception $e) {    
    // We display a error message
    die( json_encode(array("status" => "failed", "message" => "This action is not allowed"))); 
}
