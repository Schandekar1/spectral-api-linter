export const checkMethodTypes =  input => {
    debugger;
    console.log(input);
    if (input && input.length>0) {
      return [
        {
          message: 'Value must equal "hello".',
        },
      ];
    }
  };

  export default checkMethodTypes;