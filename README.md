# Patient-Registration-Front-End

An application that interfaces with BHT's [Patient Registration API](https://https://github.com/BaobabHealthTrust/Patient-Registration-API) to enable basic patient management (ie registration of patients and updating their demographics).

## Setting Up

1. Have a Ruby 5.2 installation (preferably one managed by [rvm](https://rvm.io)):

2. Navigate to the root directory of the app and set up Rails like so:

    ```bash
    bundle install
    ```

3. Set up [Webpacker](https://github.com/rails/webpacker):

    ```bash
    bundle exec rails webpacker:install
    ```

4. Start the development server and have fun...

    ```sh
    bin/rails server
    ```

    NOTE: The frontend as is now assumes the API is running on localhost:8000. You can change this address by editing the API client in `lib/prs_api/api_client.rb`. 
