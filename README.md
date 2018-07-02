# Patient-Registration-Front-End

An application that interfaces with BHT's [Patient Registration API](https://github.com/BaobabHealthTrust/Patient-Registration-API) to enable basic patient management (ie registration of patients and updating their demographics).

## Setting Up

1. Have a [Ruby 5](https://www.ruby-lang.org/en/documentation/installation/) installation (preferably one managed by [rvm](https://rvm.io)):

2. Install [nodejs](https://nodejs.org/en/download/) and [yarn](https://nodejs.org/en/download/)

3. Navigate to the root directory of the app and set up Rails like so:

    ```sh
    $ bundle install
    ...
    ```

4. Set up node/yarn as follows:

    ```sh
    $ yarn install
    ...
    ```

5. Start the development server and have fun...

    ```sh
    $ bin/rails server
    ...
    ```

    NOTE: The frontend as is right now assumes the API is running on
    localhost:8000. You can change this address by editing the API client
    in `lib/prs_api/api_client.rb`.
