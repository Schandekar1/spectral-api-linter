module.exports = input => {
    if (input && input.length>0) {
      return [
        {
          message: 'Value must equal "hello".',
        },
      ];
    }
  };